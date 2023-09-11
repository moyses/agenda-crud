
@agenda = [
  {nome: "Diego", telefone: "99993333"},
  {nome: "fulano", telefone: "33330000"}
]

def todos_contatos
  puts ""
  puts "Todos os contatos"
  puts "----------------------------------------------"
  
  @agenda.each do |contato|
    puts "#{contato[:nome]} - #{contato[:telefone]}"
  end
  
  puts "----------------------------------------------"
end

def adidionar_contato
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp

  @agenda << { nome: nome, telefone: telefone}
end

def ver_contato
  print "Qual nome você deseja: "

  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
  end
end

def editar_contato
  print "Qual contato você deseja editar? "

  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase === (nome.downcase)
      print "Nome, para editar (se quiser manter o mesmo nome aperte ENTER): "
      nome_salvo = contato[:nome]

      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

      print "Telefone, para editar (se quiser manter o mesmo telefone, aperte ENTER): "
      telefone_salvo = contato[:telefone]

      contato[:telefone] = gets.chomp
      contato[:telegong] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone] 
    end
  end
end

def remover_contato
  print "Qual contato você deseja remover? "
  nome = gets.chomp
  puts ""

  @agenda.each do |contato|
    if contato[:nome].downcase === (nome.downcase) 
      indice = @agenda.index(contato)
      @agenda.delete_at(indice)
      print "Contato removido com sucesso..."
      puts ""
      break 
    end
  end
end

loop do
  puts "\n 1. Contatos\n 2. Adicionar Contato\n 3. Ver Contatos\n 4. Editar Contato\n 5. Remover Contato\n 0. Sair\n"

  codigo = gets.chomp.to_i
  case 
  when codigo == 0
    puts "Até mais!"
    break
  when codigo == 1
    todos_contatos
  when codigo == 2
    adidionar_contato
  when codigo == 3
    ver_contato
  when codigo == 4
    editar_contato
  when codigo == 5
    remover_contato
  else
    puts ""
    puts "Esse código não existe! Escolha um código valido"  
  end
end