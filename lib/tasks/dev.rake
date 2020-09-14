namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

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
  end

end
