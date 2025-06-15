import { ModeToggle } from "@/components/ui/mode-toggle";
import { auth } from "@/lib/auth";
import { headers } from "next/headers";

export default async function Home() {
  return (
    <div>
      <div>Homepage</div>
      <ModeToggle />
    </div>
  );
}
