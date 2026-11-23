import LiveScripts.Shared
import LiveScripts.S_89a066f2a3d29a5b4930b3c2cf10650a98c99e6a0df5b63bca82cfb4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_89a066f2a3d29a5b4930b3c2cf10650a98c99e6a0df5b63bca82cfb4.script [ctx] 10000]
