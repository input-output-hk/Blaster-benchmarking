import LiveScripts.Shared
import LiveScripts.S_9757165f511ec38ca59d1b08925e40e417dd9049ffcbd3c45dbbc055.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9757165f511ec38ca59d1b08925e40e417dd9049ffcbd3c45dbbc055.script [ctx] 10000]
