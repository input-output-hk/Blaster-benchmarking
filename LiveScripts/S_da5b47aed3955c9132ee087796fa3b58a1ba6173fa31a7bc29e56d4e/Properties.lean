import LiveScripts.Shared
import LiveScripts.S_da5b47aed3955c9132ee087796fa3b58a1ba6173fa31a7bc29e56d4e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da5b47aed3955c9132ee087796fa3b58a1ba6173fa31a7bc29e56d4e.script [ctx] 10000]
