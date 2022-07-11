require 'csv'

class BulkUploadBooks
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(filepath)
    CSV.foreach(filepath, headers: true) do |book|
      Book.create(title: book[0], description: book[1])
    end
  end
end
