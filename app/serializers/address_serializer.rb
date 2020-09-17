class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :number, :district, :city, :uf, :zip
end
