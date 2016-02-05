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

unless Spree::Store.where(code: 'hoome').exists?
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

Spree::Property.where(name: 'Høyde', presentation: 'Høyde').first_or_create
Spree::Property.where(name: 'Bredde', presentation: 'Bredde').first_or_create
Spree::Property.where(name: 'Dybde', presentation: 'Dybde').first_or_create
Spree::Property.where(name: 'Varemerke', presentation: 'Varemerke').first_or_create
Spree::Property.where(name: 'Serie', presentation: 'Serie').first_or_create
Spree::Property.where(name: 'Armlene bredde', presentation: 'Armlene bredde').first_or_create
Spree::Property.where(name: 'Sittebredde', presentation: 'Sittebredde').first_or_create
Spree::Property.where(name: 'Fargenavn', presentation: 'Fargenavn').first_or_create
Spree::Property.where(name: 'Stoffmateriale', presentation: 'Stoffmateriale').first_or_create
Spree::Property.where(name: 'Piling fra 1 til 5', presentation: 'Piling fra 1 til 5').first_or_create
Spree::Property.where(name: 'Farge lyssikkerhet', presentation: 'Farge lyssikkerhet').first_or_create
Spree::Property.where(name: 'Martindale', presentation: 'Martindale').first_or_create
Spree::Property.where(name: 'Material', presentation: 'Material').first_or_create
Spree::Property.where(name: 'Stoffnavn', presentation: 'Stoffnavn').first_or_create
Spree::Property.where(name: 'Vekt', presentation: 'Vekt').first_or_create


# Stock locations
Spree::StockLocation.where(name: "Tannum", default: false, city: "Oslo", state_id: 2388, state_name: nil, country_id: 167, active: true,
                           backorderable_default: false, propagate_all_variants: false, admin_name: "", position: 0,
                           restock_inventory: true, fulfillable: true, code: "", check_stock_on_transfer: true).first_or_create
Spree::StockLocation.where(name: "Illum", default: false, city: "Oslo", state_id: 2388, state_name: nil, country_id: 167, active: true,
                           backorderable_default: false, propagate_all_variants: false, admin_name: "", position: 0,
                           restock_inventory: true, fulfillable: true, code: "", check_stock_on_transfer: true).first_or_create


# Stock Locations
illum_sl = Spree::StockLocation.where(name: "Illum", default: false,  city: "Oslo",
                           active: true, backorderable_default: false,
                           propagate_all_variants: false, check_stock_on_transfer: true).first_or_create

tannum_sl = Spree::StockLocation.where(name: "Tannum", default: false,  city: "Oslo",
                           active: true, backorderable_default: false,
                           propagate_all_variants: false, check_stock_on_transfer: true).first_or_create


default_sl = Spree::StockLocation.where(name: 'default').first_or_create

# Users
Spree::User.where(email: 'admin@hoome.no').first do |user|
  user.update_attributes(stock_location_ids: [default_sl.id])
end

Spree::User.where(email: 'illum@illum.no').first_or_create do |user|
  user.update_attributes!(password: 'illum@illum.no',
                         password_confirmation: 'illum@illum.no',
                         stock_location_ids: [illum_sl.id]
                        )
end

Spree::User.where(email: 'tannum@tannum.no').first_or_create do |user|
  user.update_attributes(password: 'tannum@tannum.no',
                         password_confirmation: 'tannum@tannum.no',
                         stock_location_ids: [tannum_sl.id]
                        )
end

