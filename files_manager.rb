Class FileManager
	def write_on_file(file_name, data)
		json = JSON.generate(data)
		file.write(file_name, json, mode: ‘w’)
	end
    def read_on_file(file_name)
		write_on_file(file_name, []) unless File.exist?(file_name)
		data = JSON.parse(file.read(file_name), { symbolize_names: true })
		data
	end
end