import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'main.dart';

class AddSongScreen extends StatefulWidget {
  const AddSongScreen({super.key});

  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _artistController = TextEditingController();
  final _albumController = TextEditingController();

  String? _selectedFilePath;
  String? _selectedFileName;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFilePath = result.files.single.path;
        _selectedFileName = result.files.single.name;
        if (_titleController.text.isEmpty) {
          _titleController.text =
              _selectedFileName!.replaceAll(RegExp(r'\.[^.]+$'), '');
        }
      });
    }
  }

  void _saveSong() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedFilePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih file audio terlebih dahulu')),
      );
      return;
    }
    Navigator.pop(
      context,
      Song(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        artist: _artistController.text.trim(),
        album: _albumController.text.trim(),
        filePath: _selectedFilePath!,
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    _albumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal',
              style: TextStyle(color: Color(0xFFFA2D48))),
        ),
        leadingWidth: 80,
        title: const Text('Tambah Lagu'),
        actions: [
          TextButton(
            onPressed: _saveSong,
            child: const Text('Simpan',
                style: TextStyle(
                    color: Color(0xFFFA2D48), fontWeight: FontWeight.w600)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol pilih file
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _selectedFilePath != null
                            ? Icons.audio_file_rounded
                            : Icons.add_circle_rounded,
                        size: 48,
                        color: const Color(0xFFFA2D48),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _selectedFileName ?? 'Pilih File Audio',
                        style: TextStyle(
                          fontSize: 15,
                          color: _selectedFilePath != null
                              ? Colors.black87
                              : Colors.grey.shade500,
                          fontWeight: _selectedFilePath != null
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (_selectedFilePath == null) ...[
                        const SizedBox(height: 4),
                        Text('mp3, wav, flac, dll',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade400)),
                      ]
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 8),
                child: Text('INFO LAGU',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        letterSpacing: 0.5)),
              ),

              // Card 3 TextField
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    _buildField(_titleController, 'Judul Lagu',
                        Icons.music_note_rounded),
                    _divider(),
                    _buildField(
                        _artistController, 'Artis', Icons.person_rounded),
                    _divider(),
                    _buildField(_albumController, 'Album', Icons.album_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
      TextEditingController ctrl, String label, IconData icon) {
    return TextFormField(
      controller: ctrl,
      validator: (val) =>
          val == null || val.trim().isEmpty ? '$label wajib diisi' : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFFA2D48), size: 20),
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _divider() => Divider(
      height: 1, thickness: 0.5, indent: 52, color: Colors.grey.shade200);
}