require 'json'

def write_on_file(file_name, data) 
    ruby = JSON.generate(data)
    File.write('file_name', data, mode: "a")
end
