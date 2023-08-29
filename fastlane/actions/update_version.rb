def self.run(params)
  UI.message "Update release version script"
  sh "./scripts/update_version.sh"
end