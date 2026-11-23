import LiveScripts.Shared
import LiveScripts.S_86359ee8e309fb960cc4d92ac02a9133d883c2323bfb123a304d4e91.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_86359ee8e309fb960cc4d92ac02a9133d883c2323bfb123a304d4e91.script [ctx] 10000]
