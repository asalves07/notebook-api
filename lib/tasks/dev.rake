namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts 'Resetando o banco de dados...'
    %x(rails db:drop db:create db:migrate)
    puts 'Banco de dados com sucesso...'

    #Criando tipos de contatos
    puts 'Cadastrando tipos de contato...'

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts 'Tipos de contatos cadastros com sucesso...'


    # Criando contatos
    puts 'Cadastrando os contatos...'

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts 'Contatos cadastrados o sucesso...'

    # Cadastrando telefone
    puts 'Cadastrando os telefones...'

    Contact.all.each do |contact|
      rand(5).times do |i|
        Phone.create!(
          number:Faker::PhoneNumber.cell_phone,
          contact: contact
        )
      end
    end
    puts 'Telefones cadastrados o sucesso...'

    # Cadastrando telefone
    puts 'Cadastrando endereços...'

    Contact.all.each do |contact|
      Address.create!(
        street:Faker::Address.street_name,
        number:Faker::Address.building_number,
        district:Faker::Address.community,
        city:Faker::Address.city,
        uf:Faker::Address.state_abbr,
        contact: contact,
        zip:Faker::Address.zip_code
      )
    end
    puts 'Endereços cadastrados o sucesso...'
    
  end
end
