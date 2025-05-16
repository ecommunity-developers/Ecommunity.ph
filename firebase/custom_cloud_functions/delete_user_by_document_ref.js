const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.deleteUserByDocumentRef = functions.https.onCall(
  async (data, context) => {
    // Check if the request is authenticated
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Unauthorized access.",
      );
    }

    try {
      const { documentRef } = data;
      // Retrieve the user ID from the document reference or any other necessary data
      const userId = await getUserIdFromDocumentRef(documentRef);
      // Delete the specified user account
      await admin.auth().deleteUser(userId);
      return { success: true };
    } catch (error) {
      console.error("Error deleting user:", error);
      throw new functions.https.HttpsError("internal", "Error deleting user.");
    }
  },
);
