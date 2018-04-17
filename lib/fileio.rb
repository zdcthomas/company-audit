require 'csv'
# reads from given csv path
class FileIo
  def self.load(path)
    File.join(File.expand_path(__FILE__), path)
    CSV.open path, headers: true, header_converters: :symbol
  end
end
