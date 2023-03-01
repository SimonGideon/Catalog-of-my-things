Class FileManager
	def write_on_file(file_name, data)
		json = JSON.generate(data)
		file.write(file_name, json, mode: ‘w’)
	end
end