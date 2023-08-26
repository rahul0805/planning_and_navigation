function omega_cross = get_om_cross(omega)
omega_cross = [
                0, -omega(3), omega(2);
                omega(3), 0, -omega(1);
                -omega(2), omega(1), 0;
                ];
end

