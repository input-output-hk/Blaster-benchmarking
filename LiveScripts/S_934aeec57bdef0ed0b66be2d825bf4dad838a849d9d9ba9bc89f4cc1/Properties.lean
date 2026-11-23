import LiveScripts.Shared
import LiveScripts.S_934aeec57bdef0ed0b66be2d825bf4dad838a849d9d9ba9bc89f4cc1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_934aeec57bdef0ed0b66be2d825bf4dad838a849d9d9ba9bc89f4cc1.script [ctx] 10000]
