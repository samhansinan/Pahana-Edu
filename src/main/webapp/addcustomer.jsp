<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
    <link href="Css/addcustomer.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <div class="logo">
            <div class="logo-icon">PE</div>
            <span style="font-weight: 600;">PahanaEdu</span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <div class="nav-icon"></div>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="addcustomer.jsp" class="nav-link">
                    <div class="nav-icon"></div>
                    Add Customer
                </a>
            </li>

            <li class="nav-item">
                <a href="#" class="nav-link">
                    <div class="nav-icon"></div>
                    Culculate & Print Bill
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <div class="nav-icon"></div>
                    Manage Item
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <div class="nav-icon"></div>
                    Help
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <div class="nav-icon"></div>
                    Exit
                </a>
            </li>

        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Header -->


        <!-- Success Message -->
        <div class="success-message" id="successMessage" style="display: none;">
            Customer added successfully!
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <div class="form-header">
                <h2 class="form-title">Customer Information</h2>
                <p class="form-subtitle">Please fill in all the required information to add a new customer</p>
            </div>

            <form id="addCustomerForm" action="addCustomer.jsp" method="POST">
                <!-- Personal Information Section -->
                <div class="form-section">
                    <h3 class="section-title">Personal Information</h3>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required" for="firstName">First Name</label>
                            <input type="text" id="firstName" name="firstName" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required" for="lastName">Last Name</label>
                            <input type="text" id="lastName" name="lastName" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required" for="email">Email Address</label>
                            <input type="email" id="email" name="email" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required" for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="dateOfBirth">Date of Birth</label>
                            <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-input">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="gender">Gender</label>
                            <select id="gender" name="gender" class="form-select">
                                <option value="">Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                                <option value="prefer-not-to-say">Prefer not to say</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Address Information Section -->
                <div class="form-section">
                    <h3 class="section-title">Address Information</h3>

                    <div class="form-row single">
                        <div class="form-group">
                            <label class="form-label required" for="address">Street Address</label>
                            <input type="text" id="address" name="address" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required" for="city">City</label>
                            <input type="text" id="city" name="city" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required" for="state">State/Province</label>
                            <input type="text" id="state" name="state" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required" for="zipCode">ZIP/Postal Code</label>
                            <input type="text" id="zipCode" name="zipCode" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required" for="country">Country</label>
                            <select id="country" name="country" class="form-select" required>
                                <option value="">Select Country</option>
                                <option value="US">United States</option>
                                <option value="CA">Canada</option>
                                <option value="UK">United Kingdom</option>
                                <option value="AU">Australia</option>
                                <option value="DE">Germany</option>
                                <option value="FR">France</option>
                                <option value="IN">India</option>
                                <option value="LK">Sri Lanka</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Business Information Section -->
                <div class="form-section">
                    <h3 class="section-title">Business Information</h3>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="company">Company Name</label>
                            <input type="text" id="company" name="company" class="form-input">
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="jobTitle">Job Title</label>
                            <input type="text" id="jobTitle" name="jobTitle" class="form-input">
                        </div>
                    </div>


                        <div class="form-group">
                            <label class="form-label" for="customerType">Customer Type</label>
                            <div class="radio-group">
                                <div class="radio-item">
                                    <input type="radio" id="individual" name="customerType" value="individual" class="radio-input" checked>
                                    <label for="individual">Individual</label>
                                </div>
                                <div class="radio-item">
                                    <input type="radio" id="business" name="customerType" value="business" class="radio-input">
                                    <label for="business">Business</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Additional Information Section -->
                <div class="form-section">
                    <h3 class="section-title">Additional Information</h3>

                    <div class="form-row single">
                        <div class="form-group">
                            <label class="form-label" for="notes">Notes</label>
                            <textarea id="notes" name="notes" class="form-textarea" placeholder="Add any additional notes about the customer..."></textarea>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label" for="referralSource">How did you hear about us?</label>
                            <select id="referralSource" name="referralSource" class="form-select">
                                <option value="">Select Source</option>
                                <option value="search-engine">Search Engine</option>
                                <option value="social-media">Social Media</option>
                                <option value="referral">Referral</option>
                                <option value="advertisement">Advertisement</option>
                                <option value="direct">Direct Visit</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="profilePicture">Profile Picture</label>
                            <input type="file" id="profilePicture" name="profilePicture" class="form-input" accept="image/*">
                        </div>
                    </div>

                    <div class="checkbox-group">
                        <input type="checkbox" id="newsletter" name="newsletter" class="checkbox-input" value="yes">
                        <label for="newsletter">Subscribe to newsletter</label>
                    </div>

                    <div class="checkbox-group">
                        <input type="checkbox" id="terms" name="terms" class="checkbox-input" required>
                        <label for="terms" class="required">I agree to the Terms and Conditions</label>
                    </div>
                </div>

                <!-- Form Buttons -->
                <div class="button-group">
                    <button type="reset" class="btn btn-secondary">Reset Form</button>
                    <button type="button" class="btn btn-danger" onclick="window.history.back()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Customer</button>
                </div>
            </form>
        </div>
    </main>
</div>