module AsyncControls
  class Install < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc "Installs hooks for Async Controls"

    def inject_file_set_controller_behavior
      file_path = 'app/controllers/hyrax/file_sets_controller.rb'
      if File.exist?(file_path)
        inject_into_file file_path, after: /include .*::FileSetControllerBehavior$/ do
          "\n  # Adds AsyncControls behaviors to the FileSetController.\n" \
            "  include AsyncControls::AsyncControlsBehavior\n"
        end
      else
        copy_file 'file_sets_controller.rb', file_path
      end
    end

    def inject_file_set_view
      file_path = 'app/views/hyrax/file_sets/_show_actions.html.erb'
      if File.exist?(file_path)
        inject_into_file file_path, after: /<div class="form-actions">$/ do
          "\n  <%= render partial: 'async_controls/actions', locals: { async_controls_presenter: @async_controls_presenter } %>\n"
        end
      else
        copy_file '_show_actions.html.erb', file_path
      end
    end

    def inject_ability
      file_path = 'app/models/ability.rb'
      inject_into_file file_path, after: "def custom_permissions" do
        "\n    can [:file_status, :stage, :unstage, :fixity], FileSet\n"
      end
    end

    def inject_engine_mount
      file_path = 'config/routes.rb'
      inject_into_file file_path, after: "mount Hyrax::Engine, at: '/'" do
        "\n  mount AsyncControls::Engine, at: '/'\n"
      end
    end

    def copy_config
      file_path = 'config/async_controls.yml.sample'
      copy_file 'async_controls.yml.sample', file_path
    end
  end
end
