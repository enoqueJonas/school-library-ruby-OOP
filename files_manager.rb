require 'json'

class FileManage
  def write_on_file(file_name, data)
    json = JSON.generate(data)
    File.write(file_name, json, mode: 'w')
  end

  def read_file(file_name)
    file = File.read(file_name)

    if file.empty?
      write_on_file(file_name, [])
      file = File.read(file_name)
    end

    JSON.parse(file, { symbolize_names: true })
  end
end
