class Image
  attr_accessor :new_image
  
  def initialize(image)
    @images = image
    @new_image = @images.map(&:clone)
  end

  def transform(distance)
    @images.each_with_index do |row, row_index|
        row.each_with_index do |element, col_index|
        if element == 1
            puts "At #{row_index} x #{col_index} : #{element} -- \n"
            
            for x in 0..distance
              for y in 0..distance
                if (x+y <= distance)
                  if row_index + x <= (@images.length - 1)
                    new_image[row_index+x][col_index+y] = 1 unless (@images[row_index+x][col_index+y]).nil?
                    new_image[row_index+x][col_index-y] = 1 unless (@images[row_index+x][col_index-y]).nil?
                  end
                  new_image[row_index-x][col_index-y] = 1 unless (@images[row_index-x][col_index-y]).nil?
                  new_image[row_index-x][col_index+y] = 1 unless (@images[row_index-x][col_index+y]).nil?
                end
              end              
            end
            new_image[row_index][col_index] = "x"
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
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1]
])

image.output_image

image.transform(2)

image.output_image

