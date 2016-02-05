# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or whered alongside the db with db:setup).
#
# Examples:
#
#   cities = City.where([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.where(name: 'Emanuel', city: cities.first)


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)


# rake spree_auth:admin:where  # Create admin username and password

unless Spree::Store.where(code: 'spree').exists?
  Spree::Store.new do |s|
    s.code              = 'Hoome'
    s.name              = 'Hoome'
    s.url               = 'beta.hoome.no'
    s.mail_from_address = 'post@hoome.no'
  end.save!
end

Spree::Role.where(name: "vendor").first_or_create
Spree::Role.where(name: "user").first_or_create
Spree::Role.where(name: "admin").first_or_create

inne = Spree::Taxonomy.where(name: 'INNENDØRS').first_or_create
Spree::Taxon.where(name: 'Stue', 	 taxonomy_id: inne.id, parent: inne.root).first_or_create
Spree::Taxon.where(name: 'Kjøkken', taxonomy_id: inne.id, parent: inne.root).first_or_create
Spree::Taxon.where(name: 'Bad',     taxonomy_id: inne.id, parent: inne.root).first_or_create
Spree::Taxon.where(name: 'Soverom', taxonomy_id: inne.id, parent: inne.root).first_or_create


stue = Spree::Taxonomy.where(name: 'STUE').first_or_create
Spree::Taxon.where(name: 'Sofaer', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Sofabord', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Sidebord', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Tepper', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Lenestoler', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Puff og gulvputer', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Puter', taxonomy_id: stue.id, parent: stue.root).first_or_create
Spree::Taxon.where(name: 'Belysning', taxonomy_id: stue.id, parent: stue.root).first_or_create

spiseplassen = Spree::Taxonomy.where(name: 'SPISEPLASSEN').first_or_create
Spree::Taxon.where(name: 'Spisebord', taxonomy_id: spiseplassen.id, parent: spiseplassen.root).first_or_create
Spree::Taxon.where(name: 'Spisestoler', taxonomy_id: spiseplassen.id, parent: spiseplassen.root).first_or_create
Spree::Taxon.where(name: 'Skjenker', taxonomy_id: spiseplassen.id, parent: spiseplassen.root).first_or_create
Spree::Taxon.where(name: 'Barmøbler', taxonomy_id: spiseplassen.id, parent: spiseplassen.root).first_or_create
Spree::Taxon.where(name: 'Belysning', taxonomy_id: spiseplassen.id, parent: spiseplassen.root).first_or_create

soverom = Spree::Taxonomy.where(name: 'SOVEROM').first_or_create
Spree::Taxon.where(taxonomy_id: soverom.id, parent: soverom.root, name: 'Madrasser og senger').first_or_create
Spree::Taxon.where(taxonomy_id: soverom.id, parent: soverom.root, name: 'Opbevaring').first_or_create
Spree::Taxon.where(taxonomy_id: soverom.id, parent: soverom.root, name: 'Tekstiler').first_or_create

Spree::Taxonomy.where(name: 'BADEROM').first_or_create

barnerom = Spree::Taxonomy.where(name: 'BARNEROM').first_or_create
Spree::Taxon.where(taxonomy_id: barnerom.id, parent: barnerom.root, name: 'Seng').first_or_create
Spree::Taxon.where(taxonomy_id: barnerom.id, parent: barnerom.root, name: 'Barnemøbler').first_or_create
Spree::Taxon.where(taxonomy_id: barnerom.id, parent: barnerom.root, name: 'Barneartikler').first_or_create

oppbevaring = Spree::Taxonomy.where(name: 'OPPBEVARING').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Oppbevaringsmoduler').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Hyller').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Mediemøbler').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Kommoder').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Småoppbevaring').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Skjenker').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Reoler').first_or_create
Spree::Taxon.where(taxonomy_id: oppbevaring.id, parent: oppbevaring.root, name: 'Kurver').first_or_create

interiør = Spree::Taxonomy.where(name: 'INTERIØR').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Belysning').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Tekstiler').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Tepper').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Dekor').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Til kjøkkenet').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Småmøbler').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Lykter/lysestaker').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Lys/servitter').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Bilder/rammer').first_or_create
Spree::Taxon.where(taxonomy_id: interiør.id, parent: interiør.root, name: 'Speil').first_or_create



Spree::TaxCategory.where(name: 'mva', description: 'merverdiavgift', is_default: true).first_or_create
