module SlugHelper

  def uniqueless_category_slug(site,slug)
      Category.exists?(site: site, slug: slug)
  end

end
