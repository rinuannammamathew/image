class Image
  attr_accessor :new_image
  
  def initialize(image)
    @images = image
    @new_image = @images.map(&:clone)
  end

  def transform
     @images.each_with_index do |row, row_index|
      row.each_with_index do |element, col_index|
        if element == 1
          new_image[row_index][col_index] = 1
          new_image[row_index][col_index+1] = 1 unless (@images[row_index][col_index+1]).nil?
          new_image[row_index][col_index-1] = 1 unless (@images[row_index][col_index-1]).nil? || col_index == 0
          new_image[row_index-1][col_index] = 1 unless (@images[row_index-1][col_index]).nil? || row_index == 0
          unless row_index == (@images.length - 1)
           new_image[row_index+1][col_index] = 1 unless (@images[row_index+1][col_index]).nil? || row_index == (@images.size - 1)
          end
        end
      end

    end
  end

  def output_image
    @new_image. each do |image|
      puts image.join
      
    end
    puts "\n"
  end
  
end
  
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
image.transform
image.output_image
