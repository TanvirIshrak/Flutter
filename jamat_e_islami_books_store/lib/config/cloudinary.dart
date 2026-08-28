/// Centralized Cloudinary configuration.
///
/// ────────────────────────────────────────────────────────────────────────────
/// HOW TO FILL THIS FILE (one-time setup, ~2 minutes):
///
/// 1. Go to https://cloudinary.com and sign up / sign in (free tier is fine).
/// 2. After login you'll land on the **Console / Dashboard**.
///    At the top you'll see a field called "Cloud name" — copy that value
///    and paste it below into [cloudName]. Example: `dhx8yabcd`.
///
/// 3. In the left sidebar click **Settings → Upload** (or visit
///    https://console.cloudinary.com/settings/upload).
///    Scroll to **Upload presets** and click "Add upload preset".
///    • Signing mode → choose **Unsigned**.
///    • Folder (optional) → leave blank or set to `jamat_islami_books`.
///    • Asset folder → `jamat_islami_books`.
///    • Allowed formats → leave default (or restrict to jpg, png, pdf, mp3).
///    Save the preset and copy its **Preset name** into [uploadPreset]
///    below. Example: `ml_default_unsigned_preset`.
///
/// 4. That's it — you do NOT need an API key on the client. Unsigned
///    uploads are safe to call from a Flutter app because Cloudinary
///    rate-limits them per preset.
///
/// Folder structure on Cloudinary after upload:
///   /jamat_islami_books/covers/<uuid>.jpg   ← book cover image
///   /jamat_islami_books/pdfs/<uuid>.pdf     ← the book PDF
///   /jamat_islami_books/audio/<uuid>.<ext>  ← audio version (optional)
///
/// If you want to restrict access to private files, switch the preset
/// signing mode to "Signed" and generate a signature on a backend, then
/// update [_uploadSigned] inside BookController. For an Islamic e-book
/// store with public reading, unsigned is the right choice.
/// ────────────────────────────────────────────────────────────────────────────
class CloudinaryConfig {
  static const String cloudName = 'uykztq25';
  static const String uploadPreset = 'islamic-ebooks';

  /// Folder paths. Cloudinary will auto-create these on first upload.
  static const String coversFolder = 'islami_books/covers';
  static const String pdfsFolder = 'islami_books/pdfs';
  static const String audioFolder = 'islami_books/audio';

  /// Build the unsigned upload endpoint.
  /// Result: https://api.cloudinary.com/v1_1/<cloud>/<resource>/upload
  static String uploadEndpoint(String resourceType) =>
      'https://api.cloudinary.com/v1_1/$cloudName/$resourceType/upload';

  /// Builds a delivery URL that is **guaranteed to be served inline**
  /// (no forced download). Adds the `fl_attachment:false` flag just after
  /// `upload/` so it works whether the asset was uploaded as `raw` or
  /// `image`. Use this for existing Cloudinary PDFs whose default delivery
  /// URL would otherwise force a download instead of inline render.
  ///
  /// Example:
  /// ```
  /// inlinePdfUrl('v1234567890', 'islami_books/pdfs/towhid.pdf', format: 'pdf')
  /// // → https://res.cloudinary.com/uykztq25/raw/upload/fl_attachment:false/v1234567890/islami_books/pdfs/towhid.pdf
  /// ```
  static String inlinePdfUrl(String publicId, {String format = 'pdf'}) {
    return 'https://res.cloudinary.com/$cloudName/raw/upload/fl_attachment:false/$publicId.$format';
  }
}