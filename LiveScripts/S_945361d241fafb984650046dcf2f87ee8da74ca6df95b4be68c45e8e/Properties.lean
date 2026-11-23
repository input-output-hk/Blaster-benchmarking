import LiveScripts.Shared
import LiveScripts.S_945361d241fafb984650046dcf2f87ee8da74ca6df95b4be68c45e8e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_945361d241fafb984650046dcf2f87ee8da74ca6df95b4be68c45e8e.script [ctx] 10000]
