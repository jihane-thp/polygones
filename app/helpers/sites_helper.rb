module SitesHelper

  def link_article(site,article)
    "/#{site.url}/#{article.slug}"
  end


  def create_site(site_url,site_name, user)

    p4 = Product.find_by(title: "hurst")

    default_template = Template.exists?(slug: "hurst") ? Template.find_by(slug: "hurst") : Template.create(name: "hurst", slug: "hurst",purchased: false)

    site = Site.new(user: current_user, name: site_name, url: site_url,template: default_template)

    category1 = Category.create(title: "Catégorie par defaut",slug: "default", site: site)
    article1 = Article.create(user: user, title: "Sample blog post", image: "https://hlfppt.org/wp-content/uploads/2017/04/placeholder.png",
        content: "<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>

          <p>Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>

      <p>Etiam porta sem malesuada magna mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>", slug: "one",category: category1, site: site )


     t = Template.create(site: site, product: p4, slug: p4.title)

     site.template = t
     site.templates << t

     tab = Tab.create(title: "Accueil", order: 1, site:  site, item: category1, home: true,url: "/"+site.url)

    site.save
    user.update(site: site)

  end

end
