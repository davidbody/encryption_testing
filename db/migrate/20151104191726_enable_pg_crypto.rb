class EnablePgCrypto < ActiveRecord::Migration
  def change
    enable_extension "pgcrypto"
  end
end
