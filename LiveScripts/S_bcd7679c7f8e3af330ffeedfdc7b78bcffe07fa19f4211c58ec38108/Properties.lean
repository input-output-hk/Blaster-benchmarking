import LiveScripts.Shared
import LiveScripts.S_bcd7679c7f8e3af330ffeedfdc7b78bcffe07fa19f4211c58ec38108.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bcd7679c7f8e3af330ffeedfdc7b78bcffe07fa19f4211c58ec38108.script [ctx] 10000]
