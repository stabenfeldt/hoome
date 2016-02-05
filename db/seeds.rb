# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)


# rake spree_auth:admin:create  # Create admin username and password

unless Spree::Store.where(code: 'spree').exists?
  Spree::Store.new do |s|
    s.code              = 'spree'
    s.name              = 'Spree Demo Site'
    s.url               = 'demo.spreecommerce.com'
    s.mail_from_address = 'spree@example.com'
  end.save!
end

Spree::Role.where(name: "vendor").first_or_create
Spree::Role.where(name: "user").first_or_create
Spree::Role.where(name: "admin").first_or_create

inne = Spree::Taxonomy.create(name: 'INNENDØRS')
Spree::Taxon.create(name: 'Stue', 	 taxonomy_id: inne.id, parent: inne.root)
Spree::Taxon.create(name: 'Kjøkken', taxonomy_id: inne.id, parent: inne.root)
Spree::Taxon.create(name: 'Bad',     taxonomy_id: inne.id, parent: inne.root)
Spree::Taxon.create(name: 'Soverom', taxonomy_id: inne.id, parent: inne.root)


stue = Spree::Taxonomy.create(name: 'STUE')
Spree::Taxon.create(name: 'Sofaer', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Sofabord', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Sidebord', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Tepper', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Lenestoler', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Puff og gulvputer', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Puter', taxonomy_id: stue.id, parent: stue.root)
Spree::Taxon.create(name: 'Belysning', taxonomy_id: stue.id, parent: stue.root)

spiseplassen = Spree::Taxonomy.create(name: 'SPISEPLASSEN')
Spree::Taxon.create(name: 'Spisebord', taxonomy_id: spiseplassen.id, parent: spiseplassen.root)
Spree::Taxon.create(name: 'Spisestoler', taxonomy_id: spiseplassen.id, parent: spiseplassen.root)
Spree::Taxon.create(name: 'Skjenker', taxonomy_id: spiseplassen.id, parent: spiseplassen.root)
Spree::Taxon.create(name: 'Barmøbler', taxonomy_id: spiseplassen.id, parent: spiseplassen.root)
Spree::Taxon.create(name: 'Belysning', taxonomy_id: spiseplassen.id, parent: spiseplassen.root)

soverom = Spree::Taxonomy.create(name: 'SOVEROM')
Spree::Taxon.create(taxonomy_id: soverom.id, parent: soverom.root, name: 'Madrasser og senger')
Spree::Taxon.create(taxonomy_id: soverom.id, parent: soverom.root, name: 'Opbevaring')
Spree::Taxon.create(taxonomy_id: soverom.id, parent: soverom.root, name: 'Tekstiler')

Spree::Taxonomy.create(name: 'BADEROM')

barnerom = Spree::Taxonomy.create(name: 'BARNEROM')
Spree::Taxon.create(taxonomy_id: barnerom.id, parent: barnerom.root, name: 'Seng')
Spree::Taxon.create(taxonomy_id: barnerom.id, parent: barnerom.root, name: 'Barnemøbler')
Spree::Taxon.create(taxonomy_id: barnerom.id, parent: barnerom.root, name: 'Barneartikler')

oppbevaring = Spree::Taxonomy.create(name: 'OPPBEVARING')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Oppbevaringsmoduler')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Hyller')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Mediemøbler')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Kommoder')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Småoppbevaring')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Skjenker')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Reoler')
Spree::Taxon.create(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Kurver')

interiør = Spree::Taxonomy.create(name: 'INTERIØR')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Belysning')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Tekstiler')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Tepper')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Dekor')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Til kjøkkenet')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Småmøbler')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Lykter/lysestaker')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Lys/servitter')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Bilder/rammer')
Spree::Taxon.create(taxonomy_id: interiør.id, parent: interiør.root, name: 'Speil')



Spree::TaxCategory.create(name: 'mva', description: 'merverdiavgift', is_default: true)
