require 'json'

class FileManage
    def initialize
    end

    def write_on_file(file_name, data) 
        json = JSON.generate(data)
        File.write(file_name, json, mode: "w") if data != []
    end
    
    def read_file(file_name)
        file = File.read(file_name)
        data = JSON.parse(file, {symbolize_names: true}) if file != nil
        data
    end
end