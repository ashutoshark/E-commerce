package in.sp.main.Services;

import in.sp.main.Entities.Admin;
import in.sp.main.Repositories.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public void registerAdmin(Admin admin) {
        adminRepository.save(admin);
    }

    public Admin authenticate(String username, String password) {
        Admin admin = adminRepository.findByUsername(username);
        if (admin != null && admin.getPassword().equals(password)) {
            return admin;
        }
        return null;
    }

    public void updateAdmin(Admin admin) {
        adminRepository.save(admin);
    }
}
