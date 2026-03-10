import { ScriptForm } from '@/components/dashboard/script-form';
import { BannerForm } from '@/components/dashboard/banner-form';

export default function CongCuMienPhiPage() {
  return (
    <div className="space-y-8">
      <section id="kich-ban">
        <ScriptForm />
      </section>
      <section id="banner">
        <BannerForm />
      </section>
    </div>
  );
}
