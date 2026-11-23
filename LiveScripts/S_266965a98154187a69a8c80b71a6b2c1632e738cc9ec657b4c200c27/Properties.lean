import LiveScripts.Shared
import LiveScripts.S_266965a98154187a69a8c80b71a6b2c1632e738cc9ec657b4c200c27.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_266965a98154187a69a8c80b71a6b2c1632e738cc9ec657b4c200c27.script [ctx] 10000]
