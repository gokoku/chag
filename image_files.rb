#!/Users/jyoji/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'rmagick'
require 'pry'

class ImageFiles
  attr_accessor :images
  def initialize
    reload
  end

  def each
    @images.each {|f| yield(f) }
  end

  def rename_dir
    puts "ファイルに大きさ情報を付けてリネームします。"
    @images.each do |f|
      new = new_name(f)
      File.rename( f, new)
      puts " ... #{new}"
    end
    reload
  end

  def filesize_down(min_size)
    puts "ファイルを#{min_size}B 以下にするように圧縮率を下げます。"
    @images.each do |f|
      img = Magick::Image.read(f).first
      i = 90
      img.strip!   # comment profile 削除
      while img.filesize >= min_size
        printf(" ... %s size:%d \t%d\%\n", f, img.filesize, i)
        img.write(f) { self.quality = i }
        i -= 10
        if i <= 0 then break end
      end
    end
  end

  def new_name (file_name, option=nil)
    new_name = file_name
    img = Magick::Image.read(file_name).first
    str = file_name.match(/(_\d+[x]?\d+)?px\.(jpg|jpeg|JPG|png|PNG)/)
    if str
      if img.columns==img.rows
        new_name = file_name.gsub str[1], "_#{img.columns}"
      else
        new_name = file_name.gsub str[1], "_#{img.columns}x#{img.rows}"
      end
    else
      file_name.match(/\.(jpg|jpeg|JPG|png|PNG)/)
      if img.columns==img.rows
        new_name = file_name.gsub /\..+?$/, "_#{img.columns.to_s}px.#{$1}"
      else
        new_name = file_name.gsub /\.(jpg|jpeg|JPG|png|PNG)$/, "_#{img.columns}x#{img.rows}px.#{$1}"
      end
    end
    new_name = new_name.sub /\.(?<ext>\w+)$/, '_' +option+'.\k<ext>' unless option.nil?
    new_name = new_name.sub /\.(jpeg|JPG)$/, ".jpg" if file_name.match /\.(jpeg|JPG)/
    new_name = new_name.sub /\.(PNG|png)$/, ".png"      if file_name.match /\.(PNG)/
    new_name
  end

  def reload
    @images = Dir.glob("*").select {|f| f =~ /.*.(jpg|jpeg|JPG|png|PNG)$/ }
  end
end
