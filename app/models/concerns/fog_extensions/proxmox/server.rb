# frozen_string_literal: true

# Copyright 2018 Tristan Robert

# This file is part of ForemanProxmox.

# ForemanProxmox is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# ForemanProxmox is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with ForemanProxmox. If not, see <http://www.gnu.org/licenses/>.

module ForemanProxmox
    module Server
        extend ActiveSupport::Concern
        def to_s
            name
        end
        def mac
            get_config.mac_addresses.first
        end
    
        def state
            get_config.status
        end
        def interfaces
            get_config.nics
        end
    
        def select_nic(fog_nics, nic)
            fog_nics[0]
        end
        def vm_description
            "Name=#{name}, vmid=#{vmid}"
        end
    end
end   