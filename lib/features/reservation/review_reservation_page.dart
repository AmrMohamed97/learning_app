import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class ReviewReservationPage extends StatefulWidget {
  const ReviewReservationPage({super.key});

  @override
  State<ReviewReservationPage> createState() => _ReviewReservationPageState();
}

class _ReviewReservationPageState extends State<ReviewReservationPage> {
  int _selectedPaymentMethod = 0; // 0 for Card, 1 for STC Pay

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'مراجعة الحجز',
          style: AppTextStyle.font20SemiBold.copyWith(
            color: MyColors.greyNormal,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: MyColors.greyNormal),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            _buildTeacherCard(),
            SizedBox(height: 16.h),
            _buildDateTimeCard(),
            SizedBox(height: 16.h),
            _buildCouponCard(),
            SizedBox(height: 16.h),
            _buildPaymentMethodCard(),
            SizedBox(height: 16.h),
            _buildInvoiceCard(),
            SizedBox(height: 24.h),
            PrimaryButton(
              isMax: true,
              onPressed: () {},
              text: 'ادفع الآن',
              height: 50.h,
              radius: 12.r,
              backgroundColor: MyColors.purpleNormal,
            ),
            SizedBox(height: 16.h),
            Text(
              'سياسة الإلغاء والاسترجاع',
              style: AppTextStyle.font14SemiBold.copyWith(
                color: MyColors.greyNormal,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'يمكنك الغاء الحجز حتي قبل 12 ساعة من موعدها',
              style: AppTextStyle.font12Regular.copyWith(
                color: MyColors.greyLightActive,
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.verified, color: MyColors.purpleNormal, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      'أ.محمد العتيبي',
                      style: AppTextStyle.font14SemiBold.copyWith(
                        color: MyColors.greyNormal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'معلم رياضيات و قدرات بخبرة 20 عام',
                  style: AppTextStyle.font12Regular.copyWith(
                    color: MyColors.greyLightActive,
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '(672 من التقييمات)',
                      style: AppTextStyle.font12Regular.copyWith(
                        color: MyColors.greyLightActive,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.star, color: MyColors.purpleNormal, size: 14.sp),
                    Icon(Icons.star, color: MyColors.purpleNormal, size: 14.sp),
                    Icon(Icons.star, color: MyColors.purpleNormal, size: 14.sp),
                    Icon(Icons.star, color: MyColors.purpleNormal, size: 14.sp),
                    SizedBox(width: 4.w),
                    Text(
                      '4.9',
                      style: AppTextStyle.font12Medium.copyWith(
                        color: MyColors.greyNormal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg', // Placeholder image
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60.w,
                height: 60.w,
                color: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '13',
                style: AppTextStyle.font16SemiBold.copyWith(
                  color: MyColors.greyNormal,
                ),
              ),
              Text(
                'نوفمبر',
                style: AppTextStyle.font12Regular.copyWith(
                  color: MyColors.greyNormal,
                ),
              ),
            ],
          ),
          Container(
            width: 1.w,
            height: 40.h,
            color: MyColors.greyLight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'يوم الاثنين ، 3 م الى 5 م',
                style: AppTextStyle.font14SemiBold.copyWith(
                  color: MyColors.greyNormal,
                ),
              ),
              Text(
                'حصة في الرياضيات البحتة',
                style: AppTextStyle.font12Regular.copyWith(
                  color: MyColors.greyLightActive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'هل لديك كود الخصم ؟ (اختياري)',
            style: AppTextStyle.font14Medium.copyWith(
              color: MyColors.greyNormal,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              SizedBox(
                width: 80.w,
                height: 45.h,
                child: PrimaryButton(
                  onPressed: () {},
                  text: 'تفعيل',
                  radius: 8.r,
                  backgroundColor: Colors.white,
                  textColor: MyColors.purpleNormal,
                  borderColor: MyColors.purpleNormal, // Assuming outline button style
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: SizedBox(
                   height: 45.h,
                  child: MyTextFormField(
                    hintText: 'أدخل كود الخصم',
                    filled: true,
                    filledColor: Colors.white,
                    borderColor: MyColors.greyLight,
                    radius: 8.r,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    hintStyle: AppTextStyle.font12Regular.copyWith(
                      color: MyColors.greyLightActive,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'اختيار طريقة الدفع',
            style: AppTextStyle.font14SemiBold.copyWith(
              color: MyColors.greyNormal,
            ),
          ),
          SizedBox(height: 12.h),
          _buildPaymentOption(
            index: 0,
            title: 'بطاقة الائتمان/الخصم',
            icons: [
              'assets/icons/mada.svg', // You might need to replace these with actual assets or icons
              'assets/icons/visa.svg',
              'assets/icons/mastercard.svg',
            ],
            isCard: true,
          ),
          SizedBox(height: 12.h),
          _buildPaymentOption(
            index: 1,
            title: 'stc pay',
            icons: ['assets/icons/stc_pay.svg'],
            isCard: false,
             isStc: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required int index,
    required String title,
    required List<String> icons,
    bool isCard = false,
    bool isStc = false,
  }) {
    final isSelected = _selectedPaymentMethod == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.purpleLight.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? MyColors.purpleNormal : MyColors.greyLight,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? MyColors.purpleNormal : MyColors.greyLight,
            ),
            const Spacer(),
             if (isCard) ...[
               // Placeholder for card icons if SVGs are not available, or use Row of Images
               // For now using simple containers or text as placeholders if assets missing
               // Ideally use SvgPicture.asset if assets exist
               _buildCardIcon(Colors.blue, 'mada'),
               SizedBox(width: 4.w),
               _buildCardIcon(Colors.blue[900]!, 'Visa'),
               SizedBox(width: 4.w),
               _buildCardIcon(Colors.red, 'Master'),
               SizedBox(width: 8.w),
             ],
             if (isStc) ...[
                Text('stc pay', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                SizedBox(width: 8.w),
             ],

            Text(
              title,
              style: AppTextStyle.font14Medium.copyWith(
                color: MyColors.greyNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCardIcon(Color color, String text) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4.r)
          ),
          child: Text(text, style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold, color: color)),
      );
  }

  Widget _buildInvoiceCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyColors.purpleLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'الفاتورة',
            style: AppTextStyle.font14SemiBold.copyWith(
              color: MyColors.greyNormal,
            ),
          ),
          SizedBox(height: 12.h),
          _buildInvoiceRow('حصة 30 دقيقة', '50 ريال'),
          SizedBox(height: 8.h),
          _buildInvoiceRow('رسوم ادارية', '5 ريال'),
          SizedBox(height: 12.h),
          const Divider(),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '55 ريال',
                style: AppTextStyle.font16SemiBold.copyWith(
                  color: MyColors.greyNormal,
                ),
              ),
              Text(
                'الاجمالي',
                style: AppTextStyle.font14SemiBold.copyWith(
                  color: MyColors.greyNormal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: AppTextStyle.font14Regular.copyWith(
            color: MyColors.greyNormal,
          ),
        ),
        Text(
          label,
          style: AppTextStyle.font14Regular.copyWith(
            color: MyColors.greyNormal,
          ),
        ),
      ],
    );
  }
}