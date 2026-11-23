import LiveScripts.Shared
import LiveScripts.S_eb09e42333cf08df60e2760c1a319751ef94a6d71a3ee83a76a87f17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb09e42333cf08df60e2760c1a319751ef94a6d71a3ee83a76a87f17.script [ctx] 10000]
