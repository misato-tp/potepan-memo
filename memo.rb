require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
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
  begin 
    file_name = gets.chomp
  puts "上書きしたい内容を記入してください"
  puts "完了したらctrl+Dを押します"
    memo = STDIN.read
  rescue
    puts $!
    puts "編集できませんでした。ファイル名を確認してください"
  ensure exit
  end
  
  CSV.open("#{file_name}.csv","r+") do |csv|
      csv<<[memo]
    end
end