Quando('faço uma requisição GET para o serviço Users') do
    @request_users = users.get_users
end
  
Então('o serviço Users deve responder com {int}') do |status_code|
    expect(@request_users.code).to eq status_code
 end
  
Então('retornar a lista de usuários') do
    expect(@request_users.message).not_to be_empty
end

Quando('faço uma requisição GET para o serviço Users informando id') do
    @id= sort_id.to_i
    @request_users = users.get_user(@id)
    print 
end
  
Então('retornar o usuário') do
    expect(@request_users.parsed_response['ID']).to eql @id
    print @id
end

Quando('faço uma requisição POST para o serviço Users') do
    @payload_users = build(:user).user_hash
    @request_users = users.post_users(@payload_users)
 end
  
Então('retornar o usuário criado') do
    expect(@request_users['ID']).to eql @payload_users[:ID]
    expect(@request_users['UserName']).to eql @payload_users[:UserName]
    expect(@request_users['Password'].to_i).to eql @payload_users[:Password]
end