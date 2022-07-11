class BulkDestroyBooks
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Book.destroy_all
  end
end
