package in.sp.main.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.UserRepository;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

  
    public User registerUser(User user) {
        return userRepository.save(user);
    }


    public User authenticate(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }

    
    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

  
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    
    public User updateUser(User user) {
       
        if (userRepository.existsById(user.getId())) {
            return userRepository.save(user);
        }
        return null;
    }


    public void deleteUser(Long id) {
        if (userRepository.existsById(id)) {
            userRepository.deleteById(id);
        }
    }
}
