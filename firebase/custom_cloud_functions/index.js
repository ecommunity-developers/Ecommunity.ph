const admin = require("firebase-admin/app");
admin.initializeApp();

const deleteUserByDocumentRef = require("./delete_user_by_document_ref.js");
exports.deleteUserByDocumentRef =
  deleteUserByDocumentRef.deleteUserByDocumentRef;
