//
//  CommonFunctions.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 05/04/21.
//

import Foundation
import UIKit
import FirebaseAuth

//Showing alert message
func alertDialog(message: String,self: UIViewController) {
    let alertController = UIAlertController(title: errorOpps, message: message, preferredStyle: UIAlertController.Style.alert)
    alertController.addAction(UIAlertAction(title: messageOK, style: UIAlertAction.Style.default, handler: nil))
    self.present(alertController, animated: true, completion: nil)
    
}

func getErrorMessage(of errorCode: AuthErrorCode) -> String {
    
    switch errorCode {
    
    case .accountExistsWithDifferentCredential:
      return  "0- Indicates account linking is required."
    case .adminRestrictedOperation:
        return ("1- Indicates that the operation is admin restricted.")
    case .appNotAuthorized:
        return ("2- Indicates the App is not authorized to use Firebase Authentication with the provided API Key.")
    case .appNotVerified:
        return("3- Indicates that the app could not be verified by Firebase during phone number authentication.")
    case .appVerificationUserInteractionFailure:
        return("4- Indicates a general failure during the app verification flow.")
    case .captchaCheckFailed:
        return("5- Indicates that the reCAPTCHA token is not valid.")
    case .credentialAlreadyInUse:
        return("6- Indicates an attempt to link with a credential that has already been linked with a different Firebase account")
    case .customTokenMismatch:
        return("7- Indicates the service account and the API key belong to different projects.")
    case .dynamicLinkNotActivated:
        return("8- Indicates that a Firebase Dynamic Link is not activated.")
    case .emailAlreadyInUse:
        return("9- Indicates the email used to attempt a sign up is already in use.")
    case .emailChangeNeedsVerification:
        return("10- Indicates that the a verifed email is required to changed to.")
    case .expiredActionCode:
        return("11- Indicates the OOB code is expired.")
    case .gameKitNotLinked:
        return("12- Indicates that the GameKit framework is not linked prior to attempting Game Center signin.")
    case .internalError:
        return("13- Indicates an internal error occurred.")
    case .invalidActionCode:
        return("15- Indicates the OOB code is invalid.")
    case .invalidAPIKey:
        return("15- Indicates an invalid API key was supplied in the request.")
    case .invalidAppCredential:
        return("16- Indicates that an invalid APNS device token was used in the verifyClient request.")
    case .invalidClientID:
        return("17- Indicates that the clientID used to invoke a web flow is invalid.")
    case .invalidContinueURI:
        return("18- Indicates that the domain specified in the continue URI is not valid.")
    case .invalidCredential:
        return("19- Indicates the IDP token or requestUri is invalid.")
    case .invalidCustomToken:
        return("20- Indicates a validation error with the custom token.")
    case .invalidDynamicLinkDomain:
        return("21- Indicates that the Firebase Dynamic Link domain used is either not configured or is unauthorized for the current project.")
    case .invalidEmail:
        return("22- Indicates the email is invalid.")
    case .invalidMessagePayload:
        return("23- Indicates that there are invalid parameters in the payload during a 'send password reset email' attempt.")
    case .invalidMultiFactorSession:
        return("24- Indicates that the multi factor session is invalid.")
    case .invalidPhoneNumber:
        return("25- Indicates that an invalid phone number was provided in a call to verifyPhoneNumber:completion:.")
    case .invalidProviderID:
        return("26- Represents the error code for when the given provider id for a web operation is invalid.")
    case .invalidRecipientEmail:
        return("27- Indicates that the recipient email is invalid.")
    case .invalidSender:
        return("28- Indicates that the sender email is invalid during a “send password reset email” attempt.")
    case .invalidUserToken:
        return("29- Indicates user’s saved auth credential is invalid, the user needs to sign in again.")
    case .invalidVerificationCode:
        return("30- Indicates that an invalid verification code was used in the verifyPhoneNumber request.")
    case .invalidVerificationID:
        return("31- Indicates that an invalid verification ID was used in the verifyPhoneNumber request.")
    case .keychainError:
        return("32- Indicates an error occurred while attempting to access the keychain.")
    case .localPlayerNotAuthenticated:
        return("33- Indicates that the local player was not authenticated prior to attempting Game Center signin.")
    case .maximumSecondFactorCountExceeded:
        return("34- Indicates that the maximum second factor count is exceeded.")
    case .malformedJWT:
        return("35- Raised when a JWT fails to parse correctly. May be accompanied by an underlying error describing which step of the JWT parsing process failed.")
    case .missingAndroidPackageName:
        return("36- Indicates that the android package name is missing when the androidInstallApp flag is set to true.")
    case .missingAppCredential:
        return("37- Indicates that the APNS device token is missing in the verifyClient request.")
    case .missingAppToken:
        return("38- Indicates that the APNs device token could not be obtained. The app may not have set up remote notification correctly, or may fail to forward the APNs device token to FIRAuth if app delegate swizzling is disabled.")
    case .missingContinueURI:
        return("39- Indicates that a continue URI was not provided in a request to the backend which requires one.")
    case .missingClientIdentifier:
        return("40- Indicates an error for when the client identifier is missing.")
    case .missingEmail:
        return("41- Indicates that an email address was expected but one was not provided.")
    case .missingIosBundleID:
        return("42- Indicates that the iOS bundle ID is missing when a iOS App Store ID is provided.")
    case .missingMultiFactorSession:
        return("43- Indicates that the multi factor session is missing.")
    case .missingOrInvalidNonce:
        return("44- Indicates that the nonce is missing or invalid.")
    case .missingPhoneNumber:
        return("45- Indicates that a phone number was not provided in a call to verifyPhoneNumber:completion.")
    case .missingVerificationCode:
        return("46- Indicates that the phone auth credential was created with an empty verification code.")
    case .missingVerificationID:
        return("47- Indicates that the phone auth credential was created with an empty verification ID.")
    case .missingMultiFactorInfo:
        return("48- Indicates that the multi factor info is missing.")
    case .multiFactorInfoNotFound:
        return("49- Indicates that the multi factor info is not found.")
    case .networkError:
        return("50- Indicates a network error occurred (such as a timeout, interrupted connection, or unreachable host). These types of errors are often recoverable with a retry. The NSUnderlyingError field in the NSError.userInfo dictionary will contain the error encountered.")
    case.noSuchProvider:
        return("51- Indicates an attempt to unlink a provider that is not linked.")
    case .notificationNotForwarded:
        return("52- Indicates that the app fails to forward remote notification to FIRAuth.")
    case .nullUser:
        return("53- Indicates that a non-null user was expected as an argmument to the operation but a null user was provided.")
    case .operationNotAllowed:
        return("54- Indicates the administrator disabled sign in with the specified identity provider.")
    case .providerAlreadyLinked:
        return("55- Indicates an attempt to link a provider to which the account is already linked.")
    case .quotaExceeded:
        return("56- Indicates that the quota of SMS messages for a given project has been exceeded.")
    case .rejectedCredential:
        return("57- Indicates that the credential is rejected because it’s misformed or mismatching.")
    case .requiresRecentLogin:
        return("58- Indicates the user has attemped to change email or password more than 5 minutes after signing in.")
    case .secondFactorAlreadyEnrolled:
        return("59- Indicates that the second factor is already enrolled.")
    case .secondFactorRequired:
        return("60- Indicates that the second factor is required for signin.")
    case .sessionExpired:
        return("61- Indicates that the SMS code has expired.")
    case .tooManyRequests:
        return("62- Indicates that too many requests were made to a server method.")
    case .unauthorizedDomain:
        return("63- Indicates that the domain specified in the continue URL is not whitelisted in the Firebase console.")
    case .unsupportedFirstFactor:
        return("64- Indicates that the first factor is not supported.")
    case .unverifiedEmail:
        return("65- Indicates that the email is required for verification.")
    case .userDisabled:
        return("66- Indicates the user’s account is disabled on the server.")
    case .userMismatch:
        return("67- Indicates that an attempt was made to reauthenticate with a user which is not the current user.")
    case .userNotFound:
        return("68- Indicates the user account was not found.")
    case .userTokenExpired:
        return("69- Indicates the saved token has expired, for example, the user may have changed account password on another device. The user needs to sign in again on the device that made this request.")
    case .weakPassword:
        return("70- Indicates an attempt to set a password that is considered too weak.")
    case .webContextAlreadyPresented:
        return("71- Indicates that an attempt was made to present a new web context while one was already being presented.")
    case .webContextCancelled:
        return("72- Indicates that the URL presentation was cancelled prematurely by the user.")
    case .webInternalError:
        return("73- Indicates that an internal error occurred within a SFSafariViewController or WKWebView.")
    case .webNetworkRequestFailed:
        return("74- Indicates that a network request within a SFSafariViewController or WKWebView failed.")
    case .wrongPassword:
        return("75- Indicates the user attempted sign in with a wrong password.")
    case .webSignInUserInteractionFailure:
        return("76- Indicates a general failure during a web sign-in flow.")
    default:
        return("77- Unknown error occurred")
    }
}
