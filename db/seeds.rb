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



i = Spree::Taxonomy.create(name: 'INNENDØRS')
i.taxons.create(name: 'Stue')
i.taxons.create(name: 'Kjøkken')
i.taxons.create(name: 'Bad')
i.taxons.create(name: 'Soverom')



Spree::Taxonomy.create(name: 'UTENDØRS')

stue = Spree::Taxonomy.create(name: 'STUE')
stue.taxons.create(name: 'Sofaer')
stue.taxons.create(name: 'Sofabord')
stue.taxons.create(name: 'Sidebord')
stue.taxons.create(name: 'Tepper')
stue.taxons.create(name: 'Lenestoler')
stue.taxons.create(name: 'Puff og gulvputer')
stue.taxons.create(name: 'Puter')
stue.taxons.create(name: 'Belysning')

spiseplassen = Spree::Taxonomy.create(name: 'SPISEPLASSEN')
spiseplassen.taxons.create(name: 'Spisebord')
spiseplassen.taxons.create(name: 'Spisestoler')
spiseplassen.taxons.create(name: 'Skjenker')
spiseplassen.taxons.create(name: 'Barmøbler')
spiseplassen.taxons.create(name: 'Belysning')

soverom = Spree::Taxonomy.create(name: 'SOVEROM')
soverom.taxons.create(name: 'Madrasser og senger')
soverom.taxons.create(name: 'Opbevaring')
soverom.taxons.create(name: 'Tekstiler')

Spree::Taxonomy.create(name: 'BADEROM')

barnerom = Spree::Taxonomy.create(name: 'BARNEROM')
barnerom.taxons.create(name: 'Seng')
barnerom.taxons.create(name: 'Barnemøbler')
barnerom.taxons.create(name: 'Barneartikler')

oppbevaring = Spree::Taxonomy.create(name: 'OPPBEVARING')
oppbevaring.taxons.create(name: 'Oppbevaringsmoduler')
oppbevaring.taxons.create(name: 'Hyller')
oppbevaring.taxons.create(name: 'Mediemøbler')
oppbevaring.taxons.create(name: 'Kommoder')
oppbevaring.taxons.create(name: 'Småoppbevaring')
oppbevaring.taxons.create(name: 'Skjenker')
oppbevaring.taxons.create(name: 'Reoler')
oppbevaring.taxons.create(name: 'Kurver')

interiør = Spree::Taxonomy.create(name: 'INTERIØR')
interiør.taxons.create(name: 'Belysning')
interiør.taxons.create(name: 'Tekstiler')
interiør.taxons.create(name: 'Tepper')
interiør.taxons.create(name: 'Dekor')
interiør.taxons.create(name: 'Til kjøkkenet')
interiør.taxons.create(name: 'Småmøbler')
interiør.taxons.create(name: 'Lykter/lysestaker')
interiør.taxons.create(name: 'Lys/servitter')
interiør.taxons.create(name: 'Bilder/rammer')
interiør.taxons.create(name: 'Speil')



Spree::TaxCategory.create(name: 'mva', description: 'merverdiavgift', is_default: true)
