require 'json'

module FileManage
    def write_on_file(file_name, data) 
        json = JSON.generate(data)
        File.write('file_name', json, mode: "a")
    end
    
    
    def read_file(file_name)
        data = JSON.parse(File.read(file_name))
        data
    end
end