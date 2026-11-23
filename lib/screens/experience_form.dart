import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _role = "";
  String _organization = "";
  String _category = "Organization";
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isCurrent = false;
  String _description = "";

  final List<String> _categories = [
    'Organization',
    'Internship',
    'Committee',
    'Competition',
    'Volunteer',
  ];

  String _formatDate(DateTime? date) {
    if (date == null) return "Belum dipilih";
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  Future<DateTime?> _pickDate(
    BuildContext context, {
    DateTime? initialDate,
  }) async {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: DateTime(2015),
      lastDate: DateTime(2035),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String previewRole =
        _role.trim().isEmpty ? "Posisi / Peran Anda" : _role.trim();
    final String previewOrg = _organization.trim().isEmpty
        ? "Nama Organisasi / Perusahaan"
        : _organization.trim();
    final String previewDate = _startDate == null
        ? "Periode Waktu"
        : "${_formatDate(_startDate)} - ${_isCurrent ? 'Sekarang' : (_endDate != null ? _formatDate(_endDate) : 'Belum dipilih')}";
    final String previewDesc = _description.trim().isEmpty
        ? "Ringkasan tanggung jawab atau pencapaian selama menjalani peran ini akan tampil di sini secara langsung..."
        : _description.trim();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Experience Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // === LIVE PREVIEW CARD (Kreativitas UI/UX) ===
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1E3A8A).withValues(alpha: 0.22),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.visibility_rounded,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'LIVE PREVIEW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDBEAFE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                _category,
                                style: const TextStyle(
                                  color: Color(0xFF1E3A8A),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          previewRole,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.business_rounded,
                              color: Color(0xFFDBEAFE),
                              size: 15,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                previewOrg,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFFDBEAFE),
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xFFBFDBFE),
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              previewDate,
                              style: const TextStyle(
                                color: Color(0xFFBFDBFE),
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            previewDesc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.5,
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // === FORM INPUT CONTAINER ===
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFBFDBFE),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1E3A8A).withValues(alpha: 0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Detail Pengalaman',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 14),

                        // 1. Input Posisi / Peran
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Posisi / Peran",
                            hintText: "Contoh: Chairperson of 2025 Cohort",
                            prefixIcon: const Icon(Icons.work_outline_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _role = value ?? "";
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Posisi atau peran tidak boleh kosong!";
                            }
                            if (value.trim().length < 3) {
                              return "Posisi minimal terdiri dari 3 karakter!";
                            }
                            if (value.trim().length > 100) {
                              return "Posisi maksimal 100 karakter!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),

                        // 2. Input Organisasi / Perusahaan
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Organisasi / Perusahaan",
                            hintText: "Contoh: SAMAN Universitas Indonesia",
                            prefixIcon: const Icon(Icons.apartment_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _organization = value ?? "";
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Nama organisasi/perusahaan tidak boleh kosong!";
                            }
                            if (value.trim().length < 2) {
                              return "Nama organisasi minimal 2 karakter!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),

                        // 3. Dropdown Jenis Pengalaman
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Jenis Pengalaman",
                            prefixIcon: const Icon(Icons.category_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          initialValue: _category,
                          items: _categories
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                ),
                              )
                              .toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _category = newValue;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 14),

                        // 4. Date Picker Tanggal Mulai
                        FormField<DateTime>(
                          initialValue: _startDate,
                          validator: (DateTime? value) {
                            if (_startDate == null) {
                              return "Tanggal mulai wajib dipilih!";
                            }
                            return null;
                          },
                          builder: (FormFieldState<DateTime> field) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () async {
                                    final picked = await _pickDate(
                                      context,
                                      initialDate: _startDate,
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        _startDate = picked;
                                      });
                                      field.didChange(picked);
                                    }
                                  },
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      labelText: "Tanggal Mulai",
                                      prefixIcon: const Icon(
                                        Icons.event_available_rounded,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      errorText: field.errorText,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _startDate == null
                                              ? "Pilih tanggal mulai"
                                              : _formatDate(_startDate),
                                          style: TextStyle(
                                            color: _startDate == null
                                                ? const Color(0xFF64748B)
                                                : const Color(0xFF0F172A),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.calendar_month_rounded,
                                          size: 20,
                                          color: Color(0xFF1E3A8A),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        // Toggle Masih Berlangsung (Present)
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            "Masih berlangsung hingga saat ini",
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          activeThumbColor: const Color(0xFF1E3A8A),
                          value: _isCurrent,
                          onChanged: (bool value) {
                            setState(() {
                              _isCurrent = value;
                              if (_isCurrent) {
                                _endDate = null;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 6),

                        // 5. Date Picker Tanggal Selesai (jika tidak sedang berlangsung)
                        if (!_isCurrent) ...[
                          FormField<DateTime>(
                            initialValue: _endDate,
                            validator: (DateTime? value) {
                              if (!_isCurrent && _endDate == null) {
                                return "Tanggal selesai wajib dipilih jika tidak sedang berlangsung!";
                              }
                              if (!_isCurrent &&
                                  _startDate != null &&
                                  _endDate != null &&
                                  _endDate!.isBefore(_startDate!)) {
                                return "Tanggal selesai tidak boleh lebih awal dari tanggal mulai!";
                              }
                              return null;
                            },
                            builder: (FormFieldState<DateTime> field) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () async {
                                      final picked = await _pickDate(
                                        context,
                                        initialDate: _endDate ?? _startDate,
                                      );
                                      if (picked != null) {
                                        setState(() {
                                          _endDate = picked;
                                        });
                                        field.didChange(picked);
                                      }
                                    },
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: "Tanggal Selesai",
                                        prefixIcon: const Icon(
                                          Icons.event_busy_rounded,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorText: field.errorText,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _endDate == null
                                                ? "Pilih tanggal selesai"
                                                : _formatDate(_endDate),
                                            style: TextStyle(
                                              color: _endDate == null
                                                  ? const Color(0xFF64748B)
                                                  : const Color(0xFF0F172A),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_month_rounded,
                                            size: 20,
                                            color: Color(0xFF1E3A8A),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 14),
                        ],

                        // 6. Input Deskripsi Pengalaman
                        TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: "Deskripsi Pengalaman",
                            hintText:
                                "Jelaskan peran, kontribusi, atau dampak yang dicapai...",
                            alignLabelWithHint: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(bottom: 56),
                              child: Icon(Icons.description_outlined),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _description = value ?? "";
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Deskripsi pengalaman tidak boleh kosong!";
                            }
                            if (value.trim().length < 10) {
                              return "Deskripsi minimal terdiri dari 10 karakter!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        // === TOMBOL SIMPAN ===
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E3A8A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          icon: const Icon(Icons.save_rounded),
                          label: const Text(
                            "Simpan Experience",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final String periodeText =
                                  "${_formatDate(_startDate)} - ${_isCurrent ? 'Sekarang' : _formatDate(_endDate)}";
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    title: const Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: Color(0xFF15803D),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Experience Tersimpan!',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Posisi: ${_role.trim()}'),
                                          const SizedBox(height: 6),
                                          Text(
                                            'Organisasi: ${_organization.trim()}',
                                          ),
                                          const SizedBox(height: 6),
                                          Text('Kategori: $_category'),
                                          const SizedBox(height: 6),
                                          Text('Periode: $periodeText'),
                                          const SizedBox(height: 6),
                                          Text(
                                            'Deskripsi: ${_description.trim()}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _formKey.currentState!.reset();
                                          setState(() {
                                            _role = "";
                                            _organization = "";
                                            _category = "Organization";
                                            _startDate = null;
                                            _endDate = null;
                                            _isCurrent = false;
                                            _description = "";
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}