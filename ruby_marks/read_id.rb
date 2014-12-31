$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'bundler/setup'
require 'ruby_marks'
require 'jpgcut'
require 'settings'

imageFiles = []
n = 0

#Add all files in stu_id folder to imageFiles list
Dir::glob('./stu_id/*.jpg').each {|f|
  imageFiles.push(f)
}

p imageFiles

imageFiles.each do |jpg|

  # Instantiate the Recognizer
  @recognizer.file = jpg
  gakuseki = ""
  n += 1

  # To check reading marks correctly
  flagged_recognizer = @recognizer.flag_all_marks
  flagged_recognizer.write('./marked/stu_id' + n.to_s + '.jpg')
  flagged_recognizer.destroy!

  # Put characters
  result = @recognizer.scan
  result.each do |k, v|
    if v[1][0] != nil
    	num = v[1][0]
    else
    	num = '?'
    end
  gakuseki += num
  end

  # Show and Write results
  p gakuseki
  File.open('hoge.txt', 'a') do |io|
    io.puts gakuseki
  end

end