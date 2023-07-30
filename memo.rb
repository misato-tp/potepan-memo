require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
  puts"メモしたい内容を記入してください"
  puts"完了したらctrl+Dを押します"
    memo = STDIN.read
    
  CSV.open("#{file_name}.csv","w") do |csv|
  csv<<[memo]
  end
  
elsif memo_type == 2
  puts "編集したいファイル名を拡張子を除いて入力して下さい"
    file_name = gets.chomp
  puts "上書きしたい内容を記入してください"
  puts "完了したらctrl+Dを押します"
    memo = STDIN.read
end
  
begin
  CSV.open("#{file_name}.csv","r+") do |csv|
      csv<<[memo]
  end
rescue
    puts $!
    puts "編集できませんでした。ファイル名を確認してください"
end