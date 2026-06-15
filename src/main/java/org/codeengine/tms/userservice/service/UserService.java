package org.codeengine.tms.userservice.service;

import org.codeengine.tms.userservice.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    /**
     * Create a new user
     */
    User createUser(User user);

    /**
     * Get user by ID
     */
    Optional<User> getUserById(Long id);

    /**
     * Get user by username
     */
    Optional<User> getUserByUsername(String username);

    /**
     * Get user by email
     */
    Optional<User> getUserByEmail(String email);

    /**
     * Get all users
     */
    List<User> getAllUsers();

    /**
     * Get all active users
     */
    List<User> getAllActiveUsers();

    /**
     * Update user
     */
    User updateUser(Long id, User user);

    /**
     * Delete user by ID
     */
    boolean deleteUser(Long id);

    /**
     * Search users by keyword
     */
    List<User> searchUsers(String keyword);

    /**
     * Get users by active status
     */
    List<User> getUsersByActiveStatus(Boolean isActive);

    /**
     * Count active users
     */
    long countActiveUsers();

    /**
     * Check if user exists by username
     */
    boolean userExistsByUsername(String username);

    /**
     * Check if user exists by email
     */
    boolean userExistsByEmail(String email);
}

