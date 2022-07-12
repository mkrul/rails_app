class Observer < ApplicationService

  def after_save(object)
    Slug[object.slug] = object.id.to_s
    return true
  end

  def after_destroy(object)
    Slug.destroy(id)
    return true
  end

end
