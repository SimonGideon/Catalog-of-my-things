require 'json'

class FileManager
  def write_on_file(file_name, data)
    json = JSON.generate(data)
    File.write(file_name, json, mode: 'w+')
  end

  def read_from_file(file_name)
    write_on_file(file_name, []) unless File.exists?(file_name)
    JSON.parse(File.read(file_name), { symbolize_names: true })
  end
end
