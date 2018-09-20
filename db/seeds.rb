# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### Clean Database

Tab.delete_all
User.delete_all
Article.delete_all
Category.delete_all
Template.delete_all
Plugin.delete_all
Site.delete_all
Product.delete_all


### Paramettre par default

User.create(email: "superadmin@polygone.com", password: "superadmin", role: "superadmin")

# Products

 p1 = Product.create(title: "red", image: "admin/dashboard/red.png", price: 9)
 p4 = Product.create(title: "hurst", image: "admin/dashboard/hurst.png", price: 9)

 e_plugins = []
 e_plugins << ExtensionPlugin.create(name:"mailchimp",slug:"mailchimp", price: 0,description: "mailchimp" )
 e_plugins << ExtensionPlugin.create(name:"analytics",slug:"analytics", price: 0,description: "analytics")


# #Superadmin
 User.create(email: "superadmin@polygone.com", password: "superadmin", role: "superadmin")


# # Site One
#
 user1 = User.create(email: "test@polygone.com", password: "testtest", role: "admin")
 site1 = Site.new(user: user1, name: "Mon Premier Blog", slogan: 'Mon slogan', meta_description: 'Meta descritpion', meta_title: 'meto title', url: "site1")
 category1 = Category.create(title: "Catégorie par defaut",slug: "default", site: site1)
 article1 = Article.create(user: user1, image: "http://www.grandlieuvoyages.fr/wp-content/uploads/2014/10/voyages-iles1.jpg", title: "Sample blog post",
    content: "<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>

      <p>Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>

  <p>Etiam porta sem malesuada magna mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>", slug: "one", category: category1, site: site1 )


 t = Template.create(site: site1, product: p4, slug: p4.title)

 site1.template = t

 site1.templates << t

 tab = Tab.create(title: "Accueil", order: 1, site:  site1, item: category1, home: true,url: "/"+site1.url)

 site1.save
 user1.update(site: site1)
 article1.update(site: site1)
 category1.update(site: site1)
