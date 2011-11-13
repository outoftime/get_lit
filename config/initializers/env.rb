env_path = Rails.root.join('config/env.yml').to_s
if File.exists?(env_path)
  env = YAML.load_file(env_path)[Rails.env]
  if env
    env.each_pair do |key, value|
      ENV[key.upcase] = value
    end
  end
end
